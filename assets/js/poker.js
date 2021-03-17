let type = "WebGL";
if(!PIXI.utils.isWebGLSupported()){
    type = "canvas";
}
let app = new PIXI.Application({
    width: 256,
    height: 256,
    antialias : true,
    transparent: false,
    resolution: 1
});
app.renderer.backgroundColor = 0x228b22;
document.body.appendChild(app.view);