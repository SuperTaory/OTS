package com.ttc.ssm.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface UploadService {

	public String uploadPic(MultipartFile pic) throws IllegalStateException, IOException ;
}
