package vn.iostar.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import vn.iostar.entity.Category;
import vn.iostar.repository.CategoryRepository;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryRepository categoryRepository;

	public CategoryServiceImpl(CategoryRepository categoryRepository) {
		this.categoryRepository = categoryRepository;
	}

	@Override
	public void delete(Category entity) {
		categoryRepository.delete(entity);
	}

	@Override
	public void deleteById(Long id) {
		categoryRepository.deleteById(id);
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return categoryRepository.count();
	}

	@Override
	public <S extends Category> Optional<S> findOne(Example<S> example) {
		// TODO Auto-generated method stub
		return categoryRepository.findOne(example);
	}

	@Override
	public Optional<Category> findById(Long id) {
		// TODO Auto-generated method stub
		return categoryRepository.findById(id);
	}

	@Override
	public List<Category> findAllById(Iterable<Long> ids) {
		// TODO Auto-generated method stub
		return categoryRepository.findAllById(ids);
	}

	@Override
	public List<Category> findAll(Sort sort) {
		// TODO Auto-generated method stub
		return categoryRepository.findAll(sort);
	}

	@Override
	public Page<Category> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return categoryRepository.findAll(pageable);
	}

	@Override
	public List<Category> findAll() {
		return categoryRepository.findAll();
	}

	@Override
	public Optional<Category> findByCategoryName(String name) {
		return categoryRepository.findByCategoryName(name);
	}

	@Override
	public <S extends Category> S save(S entity) {
		if (entity.getCategoryId() == null) {
			return categoryRepository.save(entity);
		} else {
			return categoryRepository.save(entity);
		}
	}

	@Override
	public Page<Category> findByCategoryNameContaining(String name, Pageable pageable) {
		// TODO Auto-generated method stub
		return categoryRepository.findByCategoryNameContaining(name, pageable);
	}

	@Override
	public List<Category> findByCategoryNameContaining(String name) {
		// TODO Auto-generated method stub
		return categoryRepository.findByCategoryNameContaining(name);
	}

}
