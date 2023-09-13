#pragma once

#ifdef HZ_PLATFORM_WINDOWS

extern Engine::Application* Engine::CreateApplication();
	
int main(int argc, char** argv) {
	printf("Game engine");
	auto app = Engine::CreateApplication();
	app->Run();
	delete app;
};
	
#endif