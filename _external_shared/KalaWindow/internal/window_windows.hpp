//Copyright(C) 2025 Lost Empire Entertainment
//This program comes with ABSOLUTELY NO WARRANTY.
//This is free software, and you are welcome to redistribute it under certain conditions.
//Read LICENSE.md for more information.

#ifdef KALAKIT_WINDOWS

//kalakit
#include "window.hpp"

namespace KalaKit
{
    class Window_Windows
    {
    public:
        static inline HWND newWindow = nullptr;
        static inline WNDPROC newProc = nullptr;
        static inline HGLRC newGLContext = nullptr;
    };
}

#endif // KALAKIT_WINDOWS