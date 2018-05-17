package com.health.config;

import org.mybatis.spring.mapper.MapperScannerConfigurer;

public class MapperConfigurer extends MapperScannerConfigurer {

	/**
	 * ê¸°ë³¸ ? •ë³?(anntationClass, sqlSessionFactoryBeanName)?œ¼ë¡? ?„¤? •?•œ?‹¤.
	 */
	public MapperConfigurer() {
		super.setAnnotationClass(Mapper.class);
		super.setSqlSessionFactoryBeanName("sqlSession");
	}
	
}
