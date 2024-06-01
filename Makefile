# Compiler and flags
CXX = g++
CXXFLAGS = -g -O0 -fprofile-arcs -ftest-coverage
LDFLAGS = -lgcov

# Source files and objects
SRC_FILES = hello1.cpp hello2.cpp hello3.cpp main.cpp
OBJ_FILES = $(SRC_FILES:.cpp=.o)
LINKED_OBJS = main.o hello1.o hello2.o

# Executable
EXEC = program

# Default build
all: $(OBJ_FILES) $(EXEC) coverage

# Main program
$(EXEC): $(LINKED_OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

# Generic rule for object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Run the program
run: $(EXEC)
	./$(EXEC)

# Collect coverage data
coverage:
	lcov --directory . --zerocounters
	lcov --capture --initial --directory . --output-file base.info
	./$(EXEC)
	lcov --capture --directory . --output-file test.info
	lcov --add-tracefile base.info --add-tracefile test.info --output-file total.info
	genhtml total.info --output-directory coverage_report

# Clean up
clean:
	rm -f $(OBJ_FILES) $(EXEC) *.gcda *.gcno
	rm -rf coverage_report *.info

.PHONY: all run clean coverage
