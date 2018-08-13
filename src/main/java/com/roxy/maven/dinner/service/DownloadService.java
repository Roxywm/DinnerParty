package com.roxy.maven.dinner.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

public interface DownloadService {

    void downloadSolve(HttpServletRequest request, HttpServletResponse response, File file) throws IOException;

}
