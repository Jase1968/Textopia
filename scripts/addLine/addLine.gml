var newLine = argument0;
var lineColor = argument1;
hist[0]++;
for(var h = hist[0]; h > 1; h--){
hist[h] = hist[h - 1];
col[h] = col[h - 1];
}
hist[1] = newLine;
col[1] = lineColor;

return true;