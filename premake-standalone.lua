glfwoutputdir = "%{cfg.buildcfg}-%{cfg.architecture}"

workspace "GLFW"
	architecture "x64"
	configurations {"Debug","Release"}

    filter "system:windows"
      buildoptions { "/EHsc", "/Zc:preprocessor", "/Zc:__cplusplus" }
      defines { "_CRT_SECURE_NO_WARNINGS","WIN32_LEAN_AND_MEAN" }
      systemversion "latest"

    filter "configurations:Debug"
      defines { "_DEBUG" }
      runtime "Debug"
      symbols "On"

    filter "configurations:Release"
      defines { "NDEBUG" }
      runtime "Release"
      optimize "On"
      symbols "Off"

project "glfw"
	kind "StaticLib"
	language "C"
	warnings "off"
	staticruntime "off"

	targetdir ("bin/" .. glfwoutputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. glfwoutputdir .. "/%{prj.name}")

	files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/glfw_config.h",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",

		"src/null_init.c",
		"src/null_joystick.c",
		"src/null_monitor.c",
		"src/null_window.c",

		"src/platform.c",
		"src/window.c",
		"src/vulkan.c"
	}

	filter "system:windows"
		systemversion "latest"

		files
		{
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_module.c",
			"src/win32_monitor.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/wgl_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c"
		}