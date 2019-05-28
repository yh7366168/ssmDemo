<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<style>
    .boxParent{
        display:flex;
        width:1200px;
        height:800px;
        border: 1px solid yellow;
        margin: 0 auto;
    }
    .divider{
        flex-basis: 8px;
        border-right: 1px solid #ccc;
        background:#ccc;
        cursor: ew-resize
    }
    .left{
        padding: 16px;
        flex-basis: 300px;
        overflow: auto;
        background: #fff;
        max-height: 100%
    }
</style>
<body>
<div class="boxParent">
    <div id="gridMove" class="left">
        左侧目录文件
    </div>
    <div
            class="divider"
            id="divider"
    >
    </div>
    <div class="right">
        <div>
            右侧文件内容
        </div>
    </div>
</div>
<script type="text/javascript">
    var moveWidth = 300;
    var startPageX=0;
    var startAsideWidth=0;
    var divider=document.getElementById("divider");
    var gridMove=document.getElementById("gridMove");

    /*ondragstart DOM属性 开始拖动时触发
    * */
    divider.ondragstart=function(e){
        startPageX = e.pageX;
        startAsideWidth = moveWidth;
    };
    divider.ondrag=function(e){
        if (e.pageX) {
            var offset = e.pageX - startPageX;
            var width = startAsideWidth + offset;
            if (width !== moveWidth) {
                moveWidth = width;
                if (width < 100) {
                    width = 100;
                }
                gridMove.style.flexBasis= width + 'px';
            }
        }
    }
</script>
</body>
</html>
