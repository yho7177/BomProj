package com.bom.etc;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class Upload {
	public void Upload () {
		
	}

	public String upFileReName(String upPath, String originalFilename, byte[] bytes) throws IOException {
		UUID uuid = UUID.randomUUID();
		
		String saveName = uuid.toString() + "_" + originalFilename;
		String savePath = calculatePath(upPath);
		
		
		File target = new File(upPath + savePath + File.separator, saveName);
		FileCopyUtils.copy(bytes, target);
		
		saveName = savePath + File.separator + saveName;
		return saveName;
	}

	private String calculatePath(String upPath) {
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator + (cal.get(Calendar.YEAR) + ""); // \2021
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1); // \2021\09
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE)); // \2021\09\03
		System.out.println(datePath);
		
		makeDir(upPath, yearPath, monthPath, datePath);		
	
		return datePath;
	}

	private void makeDir(String upPath, String...paths) {
		if(new File(upPath + paths[paths.length -1]).exists()) {
			
			return;
		}
		
		for (String path : paths) {
			File dirPath = new File(upPath + path);
			
			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
		
	}
	
	
}
