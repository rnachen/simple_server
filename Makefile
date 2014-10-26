all:
	mkdir -p bin/include
	mkdir -p bin/lib
	cp src/*.h bin/include/
	g++ -c -I dependency/simple_log/include/ -I src src/http_parser.cpp -o bin/http_parser.o
	g++ -c -I dependency/simple_log/include/ -I src src/http_server.cpp -o bin/http_server.o
	ar -rcs libsimpleserver.a bin/*.o
	mv libsimpleserver.a bin/lib/
	rm -rf bin/*.o
test: test/http_server_test.cpp
	g++ -I dependency/simple_log/include/ -I bin/include test/http_server_test.cpp dependency/simple_log/lib/libsimplelog.a bin/lib/libsimpleserver.a -o bin/http_server_test
	