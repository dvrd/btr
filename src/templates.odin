package main

import "libs:temple"

List :: struct {
	todos: []^Todo,
	count: Count,
	page:  Page,
}

Count :: struct {
	total:     int,
	active:    int,
	completed: int,
	oob:       bool,
}

count :: proc(session: ^Session) -> Count {
	return(
		Count {
			total = len(session.list),
			completed = session.completed,
			active = len(session.list) - session.completed,
			oob = true,
		} \
	)
}

tmpl_index := temple.compiled("templates/index.tmpl", List)
tmpl_list := temple.compiled("templates/list.tmpl", List)
tmpl_todo := temple.compiled("templates/todo.tmpl", ^Todo)
tmpl_count := temple.compiled("templates/count.tmpl", Count)
