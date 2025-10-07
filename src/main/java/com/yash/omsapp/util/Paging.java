package com.yash.omsapp.util;

public class Paging {
	private int page = 1;
	private int size = 12;

	public Paging() {
	}

	public Paging(int page, int size) {
		this.page = page;
		this.size = size;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = Math.max(page, 1);
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = Math.max(size, 1);
	}

	public int offset() {
		return (page - 1) * size;
	}
}
