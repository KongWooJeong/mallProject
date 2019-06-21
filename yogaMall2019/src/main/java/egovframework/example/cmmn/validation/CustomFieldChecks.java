package egovframework.example.cmmn.validation;

import org.apache.commons.validator.Field;
import org.apache.commons.validator.GenericValidator;
import org.apache.commons.validator.ValidatorAction;
import org.springframework.validation.Errors;
import org.springmodules.validation.commons.FieldChecks;

import egovframework.example.join.service.JoinVO;

public class CustomFieldChecks extends FieldChecks {
	
	public static boolean pwConfirmChk(Object bean, ValidatorAction va, Field field, Errors errors) {
		
		String pwConfirmValue = FieldChecks.extractValue(bean, field),
			   pwd			  = ((JoinVO)bean).getPwd();
		
		System.out.println("### pwConfirmValue : " + pwConfirmValue);
		
		if(pwConfirmValue.equals(pwd)) {
			return true;
		} else {
			FieldChecks.rejectValue(errors, field, va);
			
			return false;
		}
		
	}
	
	public static boolean idValidChk(Object bean, ValidatorAction va, Field field, Errors errors) {

        String idValue = FieldChecks.extractValue(bean, field);
        String regExp = "^(?=.*[a-zA-Z])(?=.*[0-9]).{8,12}$";
        
        System.out.println("### idValue : " + idValue);
        
        if (idValue.matches(regExp)) {
            return true;
        } else {
        	FieldChecks.rejectValue(errors, field, va);
            
        	return false;
        }

    }
	public static boolean phoneValidChk(Object bean, ValidatorAction va, Field field, Errors errors) {
		
		String phoneValue = FieldChecks.extractValue(bean, field);
		String regExp = "^(01[0167898]{1})[1-9]{3,4}[1-9]{4}";
		
		System.out.println("### phoneValue : " + phoneValue);
		
		if (phoneValue.matches(regExp)) {
			return true;
		} else {
			FieldChecks.rejectValue(errors, field, va);
			
			return false;
		}
		
	}
	public static boolean pwValidChk(Object bean, ValidatorAction va, Field field, Errors errors) {
		
		String pwValue = FieldChecks.extractValue(bean, field);
		String regExp = "^(?=.*[a-zA-Z])(?=.*[!@#$%^+=-])(?=.*[0-9]).{8,15}$";
		
		System.out.println("### pwValue : " + pwValue);
		
		if (pwValue.matches(regExp)) {
			return true;
		} else {
			FieldChecks.rejectValue(errors, field, va);
			
			return false;
		}
		
	}
}
