package com.sami.airline_management_system_project.helper;

import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

public class DeleteFile {
    public static boolean deleteFile(String path) {
	boolean f = false;
	try {
	    File file = new File(path);
	    f = file.delete();

	} catch (Exception e) {
	    e.printStackTrace();
	}
	return f;

    }


}