package egovframework.example.cmmn.utils;

public class NumberUtil {
	
	public static int parseInt(String src) {
		return parseInt(src, 0, 10);
	}
	
	public static int parseInt(String src, int def) {
		return parseInt(src, def, 10);
	}

	public static int parseInt(String src, int def, int radix) {
		try {
			return Integer.parseInt(src, radix);
		} catch(Exception e) {
			return def;
		}
	}
	
	public static double parseDouble(String src) {
		return parseDouble(src, 0.0);
	}
	
	public static double parseDouble(String src, double def) {
		try {
			return Double.parseDouble(src);
		} catch(Exception e) {
			return def;
		}
	}

	public static long parseLong(String src) {
		return parseLong(src, 0);
	}

	public static long parseLong(String src, long def) {
		try {
			return Long.parseLong(src);
		} catch(Exception e) {
			return def;
		}
	}
}
