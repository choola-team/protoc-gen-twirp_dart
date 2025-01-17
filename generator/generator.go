package generator

import (
	"path"

	"github.com/gogo/protobuf/protoc-gen-gogo/descriptor"
)

func dartModuleFilename(f *descriptor.FileDescriptorProto) string {
	return twirpFilename(*f.Name)
}

func dartFilename(name string) string {
	if ext := path.Ext(name); ext == ".proto" || ext == ".protodevel" {
		base := path.Base(name)
		name = base[:len(base)-len(path.Ext(base))]
	}

	name += ".twirp.dart"

	return name
}

func twirpFilename(fullPath string) string {
	name := ""
	if ext := path.Ext(fullPath); ext == ".proto" || ext == ".protodevel" {
		base := path.Base(fullPath)
		name = base[:len(base)-len(path.Ext(base))]
	}
	name += ".twirp.dart"
	return path.Join(path.Dir(fullPath), name)
}

func dartDecodersFilename(packageName string) string {
	return "/" + packageName + "/" + packageName + "_decoders.twirp.dart"
}
