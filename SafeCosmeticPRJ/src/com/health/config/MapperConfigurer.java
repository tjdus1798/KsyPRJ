package com.health.config;

import org.mybatis.spring.mapper.MapperScannerConfigurer;

public class MapperConfigurer extends MapperScannerConfigurer {

	/**
	 * 기본 ?���?(anntationClass, sqlSessionFactoryBeanName)?���? ?��?��?��?��.
	 */
	public MapperConfigurer() {
		super.setAnnotationClass(Mapper.class);
		super.setSqlSessionFactoryBeanName("sqlSession");
	}
	
}
