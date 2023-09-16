#pragma once

#ifdef EG_PLATFORM_WINDOWS
	#ifdef EG_BUILD_DLL
		#define ENGINE_API __declspec(dllexport)
	#else
		#define ENGINE_API __declspec(dllimport)
	#endif
#else
	#error GameEngine only supports Windows!
#endif

#ifdef EG_ENABLE_ASSERTS
	#define EG_ASSERT(x, ...) { if(!(x)) { EG_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugBreak(); } }
	#define EG_CORE_ASSERT(x, ...) { if(!(x)) { EG_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugBreak(); } }
#else
	#define EG_ASSERT(x, ...);
	#define EG_CORE_ASSERT(x, ...);
#endif

#define BIT(x) (1 << x)

#define EG_BIND_EVENT(x) std::bind(&x, this, std::placeholders::_1)