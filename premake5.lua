workspace "Engine"
    architecture "x64"
    startproject "Sandbox"
    
    configurations 
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "GameEngine/vendor/GLFW/include"
IncludeDir["Glad"] = "GameEngine/vendor/Glad/include"
IncludeDir["ImGui"] = "GameEngine/vendor/imgui"
IncludeDir["glm"] = "GameEngine/vendor/glm"

group "Dependecies"
    include "GameEngine/vendor/GLFW"
    include "GameEngine/vendor/Glad"
    include "GameEngine/vendor/imgui"

group ""

project "GameEngine"
    location "GameEngine"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "egpch.h"
    pchsource "GameEngine/src/egpch.cpp"

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp",
        "%{prj.name}/vendor/**.hpp",
        "%{prj.name}/vendor/**.inl"
    }

    defines
    {
        "_CRT_SECURE_NO_WARNINGS"
    }

    includedirs
    {
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.Glad}",
        "%{IncludeDir.ImGui}",
        "%{IncludeDir.glm}"
    }

    links 
    {
        "GLFW",
        "Glad",
        "ImGui",
        "opengl32.lib"
    }

    filter "system:windows"
        systemversion "latest"

        defines {
            "EG_PLATFORM_WINDOWS",
            "EG_BUILD_DLL",
            "GLFW_INCLUDE_NONE"
        }

    filter "configurations:Debug"
        defines "EG_DEBUG"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        defines "EG_RELEASE"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        defines "EG_DIST"
        runtime "Release"
        symbols "on"


project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "GameEngine/vendor/spdlog/include",
        "GameEngine/src",
        "GameEngine/vendor",
        "%{IncludeDir.glm}"
    }

    links {
        "GameEngine"
    }

    filter "system:windows" 
        systemversion "latest"

        defines {
            "EG_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "EG_DEBUG"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        defines "EG_RELEASE"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        defines "EG_DIST"
        runtime "Release"
        symbols "on"
