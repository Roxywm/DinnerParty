package com.roxy.maven.dinner.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface IDownloadService {

    void downloadSolve(HttpServletRequest request, HttpServletResponse response, String fileName) throws IOException;

}
