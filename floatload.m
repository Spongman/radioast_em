function data = floatload(filename,rows,cols)
fid = fopen(filename,'r');
data = fread(fid,[rows,cols],'float','b');
fclose(fid);
end
