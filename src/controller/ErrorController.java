package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorController {
 
    @RequestMapping(value = "errors", method = RequestMethod.GET)
    public String renderErrorPage(HttpServletRequest httpRequest) {

        int httpErrorCode = getErrorCode(httpRequest);
        String returnError = "errors/404";
        switch (httpErrorCode) {
            case 400: {
                returnError = "errors/400";
                break;
            }
            case 401: {
            	returnError = "errors/401";
                break;
            }
            case 403: {
            	returnError = "errors/403";
                break;
            }
            case 404: {
            	returnError = "errors/404";
                break;
            }
            case 500: {
            	returnError = "errors/500";
                break;
            }
        }
        return returnError;
    }
     
    private int getErrorCode(HttpServletRequest httpRequest) {
        return (Integer) httpRequest
          .getAttribute("javax.servlet.error.status_code");
    }
}