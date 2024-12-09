package vn.iostar.services;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import vn.iostar.entity.Category;
import vn.iostar.entity.Field;

public interface FieldService {

	<S extends Field> List<S> findAll(Example<S> example, Sort sort);

	void deleteAllById(Iterable<? extends Integer> ids);

	void delete(Field entity);

	long count();

	<S extends Field> Page<S> findAll(Example<S> example, Pageable pageable);

	Optional<Field> findById(Integer id);

	List<Field> findAllById(Iterable<Integer> ids);

	List<Field> findAll(Sort sort);

	List<Field> findAll();

	<S extends Field> S save(S entity);

	Optional<Field> findByFieldName(String name);

	List<Field> findByFieldNameContaining(String name);

	void deleteById(int id);
	
	List<Field> findByCategory(Category category);
}
