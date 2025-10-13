// GreetingTag.java
package mytags;

import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

public class GreetingTag extends SimpleTagSupport {
    private String user;

    public void setUser(String user) {
        this.user = user;
    }

    public void doTag() throws JspException, IOException {
        JspWriter out = getJspContext().getOut();
        out.println("Hello, " + user + "! Welcome to the site.");
    }
}
