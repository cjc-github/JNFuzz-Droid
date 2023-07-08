python3 generate_protobuf_file.py > ast.proto
protoc --python_out=. --java_out=java_files ast.proto
