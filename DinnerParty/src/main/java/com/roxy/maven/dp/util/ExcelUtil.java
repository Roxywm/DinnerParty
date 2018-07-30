package com.roxy.maven.dp.util;


import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import org.apache.commons.lang3.StringUtils;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ExcelUtil<T> {

    public List<T> getExcelData(Class<?> type, String src) throws IOException, BiffException {
        List<T> list = new ArrayList<T>();

        Workbook rwb=Workbook.getWorkbook(new File(src));//读取xls文件
        Sheet rs=rwb.getSheet(0);//或者rwb.getSheet(0)
        int clos=rs.getColumns();//得到所有的列
        int rows=rs.getRows();//得到所有的行

        for (int i = 1; i < rows; i++) {
            Map<String, Object> map = new HashMap<String, Object>();
            for (int j = 0; j < clos; j++) {
                String field = rs.getCell(j, 0).getContents();//获取属性名
                String value = rs.getCell(j, i).getContents();//获取属性值
                map.put(field, value);
            }
            Object bean = createBean(type, map);
            list.add((T)bean);
        }
        return list;
    }

    public String writerExcelData(List<T> list, String fileName){
        File file = null;
        try {
            Class<?> clazz = list.get(0).getClass();
            WritableWorkbook wwb = null;
            // 创建可写入的Excel工作簿
            file=new File(fileName);
            if (!file.exists()) {
                file.createNewFile();
            }
            //以fileName为文件名来创建一个Workbook
            wwb = Workbook.createWorkbook(file);
            WritableSheet ws = wwb.createSheet(clazz.toString().substring(clazz.toString().lastIndexOf(".")+1), 0);

            Field[] fields = clazz.getDeclaredFields();
            //设置表头
            for(int i=0;i<fields.length; i++){
                Label label= new Label(i, 0, fields[i].getName());
                ws.addCell(label);
            }

            for (int i = 0; i < list.size(); i++){
                //循环写入每个对象的属性值
                for(int j=0;j<fields.length; j++){
                    //获取getter方法
                    String str = fields[j].getName().substring(0, 1).toUpperCase()+fields[j].getName().substring(1);
                    String getMethodName="get"+str;//id --->getId
                    //调用getter方法
                    Method getMethod=clazz.getDeclaredMethod(getMethodName);
                    Object invoke = getMethod.invoke(list.get(i));//获取该对象该属性的值
                    //写入一个对象的属性值
                    Label label= new Label(j, i+1, invoke==null?"":invoke.toString());//当属性值为null时写入空字符
                    ws.addCell(label);
                }
            }

            //写进文档
            wwb.write();
            // 关闭Excel工作簿对象
            wwb.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return file.getName();
    }

    /**
     * 实例化对象
     * @param clazz
     * @param map  key:属性   value:值
     * @return
     */
    public static Object createBean(Class<?> clazz, Map<String, Object> map){
        Object targetObj=null;
        try {
            Field[] fields = clazz.getDeclaredFields();//获取类定义的字段

            targetObj=clazz.newInstance();
            for(Field f:fields){

                f.setAccessible(true);
                String str = f.getName().substring(0, 1).toUpperCase()+f.getName().substring(1);
                String getMethodName="get"+str;//id --->getId
                String setMethodName = "set"+str;
                if("getSerialVersionUID".equals(getMethodName)&&"setSerialVersionUID".equals(setMethodName)){
                    continue;
                }

                Method getMethod=clazz.getDeclaredMethod(getMethodName);
                Method setMethod = clazz.getDeclaredMethod(setMethodName, getMethod.getReturnType());
                String returnType=getMethod.getReturnType().toString();
                Object value =null;
                if(returnType.equals("class java.lang.String")){
                    value= (String) map.get(f.getName());
                }else if(returnType.equals("class java.lang.Integer")){
                    String s = (String) map.get(f.getName());
                    if(StringUtils.isNotEmpty(s)){
                        value=Integer.valueOf(s);
                    }
                }else if(returnType.equals("class java.lang.Long")){
                    String s = (String) map.get(f.getName());
                    if(StringUtils.isNotEmpty(s)){
                        value=Long.valueOf(s);
                    }
                }else if(returnType.equals("class java.lang.Float")){
                    String s = (String) map.get(f.getName());
                    if(StringUtils.isNotEmpty(s)){
                        value=Float.valueOf(s);
                    }
                }else if(returnType.equals("class java.lang.Double")){
                    String s = (String) map.get(f.getName());
                    if(StringUtils.isNotEmpty(s)){
                        value=Double.valueOf(s);
                    }
                }else if(returnType.equals("class java.util.Date")){
                    if(StringUtils.isNotEmpty((String) map.get(f.getName()))){
                        value = DateUtil.parseDate((String) map.get(f.getName()));
                    }
                }else if(returnType.equals("class java.sql.Timestamp")){
                    value = DateUtil.parseTimestamp((String) map.get(f.getName()));
                }
                setMethod.invoke(targetObj, value);
            }
            return targetObj;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return targetObj;
    }


}
