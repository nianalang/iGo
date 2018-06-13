package com.igo.tag;

import javax.servlet.jsp.JspException;

public class PageTag extends BaseTagSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private PageObject object;//分页对象
	
	private String script; //页面javaScript方法名
	
	public PageObject getObject() {
		return object;
	}

	public void setObject(PageObject object) {
		this.object = object;
	}
	public String getScript() {
		return script;
	}

	public void setScript(String script) {
		this.script = script;
	}

	public int doStartTag() throws JspException {
		int[] iparams={0,0,0};
		String sparams="";
		if(object!=null && object.getData()!=null){
			iparams[0]=object.getPageCount();//总的页数
			iparams[1]=object.getCurPage();//当前页数
		
			if(script!=null && script!=""){
				sparams=script;
			}			
		}
		getRequest().setAttribute("iPageObjectTag", iparams);
		getRequest().setAttribute("sPageObjectTag", sparams);
		return EVAL_BODY_INCLUDE;
	}

	public int doEndTag() throws JspException {
		getRequest().removeAttribute("iPageObjectTag");
		getRequest().removeAttribute("sPageObjectTag");
		return EVAL_PAGE;
	}
}

