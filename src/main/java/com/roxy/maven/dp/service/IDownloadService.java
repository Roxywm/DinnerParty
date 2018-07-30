package com.roxy.maven.dp.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface IDownloadService {

    void downloadSolve(HttpServletRequest request, HttpServletResponse response, String fileName) throws IOException;

}
