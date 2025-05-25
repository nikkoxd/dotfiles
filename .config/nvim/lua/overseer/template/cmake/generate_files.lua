return {
  name = "Generate CMake build files",
  builder = function()
    return {
      cmd = { "cmake" },
      args = { "-S", ".", "-B", "build", "-DCMAKE_BUILD_TYPE=Debug" }
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
}
