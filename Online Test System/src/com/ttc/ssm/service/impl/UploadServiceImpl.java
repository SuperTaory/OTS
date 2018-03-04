package com.ttc.ssm.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.ttc.ssm.service.UploadService;

public class UploadServiceImpl implements UploadService{
	
	public String uploadPic(MultipartFile pic) throws IllegalStateException, IOException {
		String originalFilename = pic.getOriginalFilename();
		if (pic != null && originalFilename != null
				&& originalFilename.length() > 0) {
			
			String pic_path = "C:\\TEMP\\";
			String newFileName = UUID.randomUUID()
					+ originalFilename.substring(originalFilename
							.lastIndexOf("."));
			File newFile = new File(pic_path + newFileName);
			pic.transferTo(newFile);
			return newFileName;
		}
		return null;
	}
}
