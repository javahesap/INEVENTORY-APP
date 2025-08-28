package com.example.inventory.report;

import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.Connection;
import java.util.Map;

@Service
public class JasperReportService {

    private final DataSource dataSource;

    public JasperReportService(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public JasperPrint fillWithJdbc(String jrxmlPath, Map<String,Object> params) throws Exception {
        try (InputStream in = new ClassPathResource(jrxmlPath).getInputStream()) {
            JasperReport report = JasperCompileManager.compileReport(in);
            Connection conn = DataSourceUtils.getConnection(dataSource);
            try {
                return JasperFillManager.fillReport(report, params, conn);
            } finally {
                DataSourceUtils.releaseConnection(conn, dataSource);
            }
        }
    }

    public JasperPrint fillWithBeans(String jrxmlPath, Map<String,Object> params, java.util.Collection<?> beans) throws Exception {
        try (InputStream in = new ClassPathResource(jrxmlPath).getInputStream()) {
            JasperReport report = JasperCompileManager.compileReport(in);
            JRBeanCollectionDataSource ds = new JRBeanCollectionDataSource(beans);
            return JasperFillManager.fillReport(report, params, ds);
        }
    }

    public byte[] exportPdf(JasperPrint print) throws JRException {
        return JasperExportManager.exportReportToPdf(print);
    }

    public byte[] exportHtml(JasperPrint print) throws JRException {
        return JasperExportManager.exportReportToXml(print).getBytes(); // basit HTML yerine XML; istersen HtmlExporter kullan
    }
}
