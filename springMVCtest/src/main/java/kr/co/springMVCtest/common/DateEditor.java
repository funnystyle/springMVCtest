package kr.co.springMVCtest.common;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateEditor extends PropertyEditorSupport {

	public void setAsText(String value) {
		try {
			setValue(new SimpleDateFormat("yyyy-MM-dd").parse(value));
		} catch (ParseException e) {
			setValue(null);
		}
	}

	public String getAsText() {
		String s = "";
		if (getValue() != null) {
			s = new SimpleDateFormat("yyyy-MM-dd").format((Date) getValue());
		}
		return s;
	}
}
