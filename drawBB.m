function im = drawBB(im, bb)

for i = bb(1):bb(3)
    im(bb(2), i, 1) = 0;
    im(bb(2), i, 2) = 255;
    im(bb(2), i, 3) = 0;
end
for i = bb(1):bb(3)
    im(bb(4), i, 1) = 0;
    im(bb(4), i, 2) = 255;
    im(bb(4), i, 3) = 0;
end
for i = bb(2):bb(4)
    im(i, bb(1), 1) = 0;
    im(i, bb(1), 2) = 255;
    im(i, bb(1), 3) = 0;
end
for i = bb(2):bb(4)
    im(i, bb(3), 1) = 0;
    im(i, bb(3), 2) = 255;
    im(i, bb(3), 3) = 0;
end