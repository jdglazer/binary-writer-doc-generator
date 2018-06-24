package com.jdglazer.binwrite.document.html;

import static org.junit.Assert.*;

import java.io.IOException;

import org.junit.Test;

import com.jdglazer.binwrite.dataaccess.types.complex.ArrayPrototype;
import com.jdglazer.binwrite.dataaccess.types.complex.ObjectPrototype;
import com.jdglazer.binwrite.dataaccess.types.complex.StringPrototype;
import com.jdglazer.binwrite.dataaccess.types.primitive.BitPrototype;
import com.jdglazer.binwrite.dataaccess.types.primitive.BooleanPrototype;
import com.jdglazer.binwrite.dataaccess.types.primitive.FloatPrototype;
import com.jdglazer.binwrite.dataaccess.types.primitive.IntegerPrototype;

import freemarker.template.TemplateException;
import junit.framework.TestCase;

public class ObjectGraphicalRepresentationTest extends TestCase {

	@Test
	public void testFormat() throws IOException, TemplateException {
		
		ObjectPrototype proto = new ObjectPrototype("Test Object");
		
		proto.setDescription("This is a test of the creating a document for a file format");
		
		StringPrototype str = new StringPrototype("Name");
		IntegerPrototype intP = new IntegerPrototype("Age");
		    intP.setLength(16);
		BooleanPrototype bool = new BooleanPrototype("PA Resident");
		ArrayPrototype array = new ArrayPrototype(proto,"Children");
		FloatPrototype floatP = new FloatPrototype("Weight");
		floatP.setLength(16);
		BitPrototype bits = new BitPrototype("Encrypted Password");
		bits.setLength(32);
		
		proto.appendDataPrototype(str);
		proto.appendDataPrototype(intP);
		proto.appendDataPrototype(floatP);
		proto.appendDataPrototype(bool);
		proto.appendDataPrototype(array);
		proto.appendDataPrototype(bits);
		
		ModelViewBindingEngine mvbe = new ModelViewBindingEngine();
		
		String html = mvbe.bind("file-format-container.ftlh", proto);
		
		//Lets parse the html for some stuff
		System.out.println(html);
		
	}

}
