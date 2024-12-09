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
import vn.iostar.entity.Field;
import vn.iostar.repository.FieldRepository;

@Service
public class FieldServiceImpl implements FieldService{
	@Autowired
	FieldRepository fieldRepository;

	public FieldServiceImpl(FieldRepository fieldRepository) {
		this.fieldRepository = fieldRepository;
	}

	@Override
	public List<Field> findByFieldNameContaining(String name) {
		return fieldRepository.findByFieldNameContaining(name);
	}

	@Override
	public Optional<Field> findByFieldName(String name) {
		return fieldRepository.findByFieldName(name);
	}

	@Override
	public <S extends Field> S save(S entity) {
		return fieldRepository.save(entity);
	}

	@Override
	public List<Field> findAll() {
		return fieldRepository.findAll();
	}

	@Override
	public List<Field> findAll(Sort sort) {
		return fieldRepository.findAll(sort);
	}

	@Override
	public List<Field> findAllById(Iterable<Integer> ids) {
		return fieldRepository.findAllById(ids);
	}

	@Override
	public Optional<Field> findById(Integer id) {
		return fieldRepository.findById(id);
	}

	@Override
	public <S extends Field> Page<S> findAll(Example<S> example, Pageable pageable) {
		return fieldRepository.findAll(example, pageable);
	}

	@Override
	public long count() {
		return fieldRepository.count();
	}

	@Override
	public void delete(Field entity) {
		fieldRepository.delete(entity);
	}

	@Override
	public void deleteAllById(Iterable<? extends Integer> ids) {
		fieldRepository.deleteAllById(ids);
	}

	@Override
	public <S extends Field> List<S> findAll(Example<S> example, Sort sort) {
		return fieldRepository.findAll(example, sort);
	}

	@Override
	public void deleteById(int id) {
		fieldRepository.deleteById(id);
	}
	
	@Override
    public List<Field> findByCategory(Category category) {
        return fieldRepository.findByCategory(category);
    }
}
