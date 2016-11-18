﻿using System.IO;
using UnityEngine;

public class LoadPNG {
    public static Texture2D LoadPNGFromFile(string filePath) { 

    Texture2D tex = null;
    byte[] fileData;

    if (File.Exists(filePath))
    {
        fileData = File.ReadAllBytes(filePath);
        tex = new Texture2D(2, 2);
        tex.LoadImage(fileData); //..this will auto-resize the texture dimensions.
    }
    return tex;
}
    }