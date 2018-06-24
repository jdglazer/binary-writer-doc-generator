package com.jdglazer.binwrite.document.html;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.Map;

import com.jdglazer.binwrite.dataaccess.types.complex.ObjectPrototype;

import freemarker.core.ParseException;
import freemarker.template.Configuration;
import freemarker.template.MalformedTemplateNameException;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateNotFoundException;

public class ModelViewBindingEngine {
    
	private Configuration configuration;
	
	public static final String TEMPLATE_INSTALL_DIRECTORY = "/Users/jglazer/Documents/eclipseWorkspace/binary-writer-doc-generator/resources/templates/html";
	
	public static final String CHARSET = "UTF-8";
	
	public ModelViewBindingEngine() throws IOException {
		
		configuration = new Configuration(Configuration.VERSION_2_3_28);
		
        configuration.setDirectoryForTemplateLoading( new File( TEMPLATE_INSTALL_DIRECTORY ) );
        
        configuration.setDefaultEncoding(CHARSET);
	}
	
	public String bind( String template,  ObjectPrototype prototype ) throws TemplateNotFoundException, MalformedTemplateNameException, ParseException, IOException, TemplateException {
		
		Template temp = configuration.getTemplate(template);
		
		Map map = new HashMap();
		
		map.put("prototype", prototype);
		
		ByteArrayOutputStream byteOutput = new ByteArrayOutputStream();
		
		OutputStreamWriter genericWriter = new OutputStreamWriter(byteOutput);
		
		temp.process(map, genericWriter);
		
		genericWriter.close();
		
		return byteOutput.toString(CHARSET);
	}
}
