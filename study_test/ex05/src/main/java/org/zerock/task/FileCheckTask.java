package org.zerock.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.zerock.domain.BoardAttachVO;
import org.zerock.mapper.BoardAttachMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileCheckTask {

	@Autowired
	private BoardAttachMapper mapper;

	private String getFolderYesterday() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);

		String str = sdf.format(cal.getTime());

		return str.replace("-", File.separator);
	}

	// 데이터베이스에 쓸데없는 파일이 있는지 검사
	// cron = "초 분 시 일 달 주 (년)"
	@Scheduled(cron = "0 0 2 * * *") // 주기 제어 매일 새벽 2시에 동작
	public void checkFiles() throws Exception {

		log.warn("파일을 체크중입니다 . . . . . . . .");
		log.warn(new Date());

		// 데이터베이스의 파일 리스트 --> 어제날짜의 파일 목록을 모두 불러온다
		List<BoardAttachVO> fileList = mapper.getOldFiles();

		// 파일 리스트를 만든다
		List<Path> fileListPaths = fileList.stream()
				.map(vo -> Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName()))
				.collect(Collectors.toList());

		// 이미지 파일의 경우 썸네일 파일까지 포함
		fileList.stream()
				.map(vo -> Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName()))
				.forEach(p -> fileListPaths.add(p));

		log.warn("==========================");

		fileListPaths.forEach(p -> log.warn(p));

		// 어제자 파일 찾기
		File targetDir = Paths.get("C:\\upload", getFolderYesterday()).toFile();

		// 실제 파일에 있는지 검사
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);

		log.warn("-----------------------------");

		// 실제 파일에 없으면 삭제
		for (File file : removeFiles) {
			log.warn(file.getAbsoluteFile());

			file.delete();
		}
	}

}
