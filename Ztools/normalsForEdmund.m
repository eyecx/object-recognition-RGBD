function [NRot, pcRot] = normalsForEdmund(im_i)
%function [NRot, pcRot] = normalsForEdmund(im_i)
% NRot is the local normals at each point in the point cloud.
% pcRot is the rotated point cloud such that the floor is horizontal.
% Note that the X-axis point to the right, Y-axis points down, Z-axis points into the image. Also, the normals are oriented such that they point into the scene, visualize N_x, N_y, N_z to verify what I mean by this.
%
% Input: im_i is the image number.
	param.selN = 4;
	param.localNormalExt = 'paPbV3_34';
	
	im_i = im_i + 5000
	c.alignDepthDir = '/work4/sgupta/kinect/iResultsNYU/alignedImages/';
	c.normalsDir = '/work4/sgupta/kinect/iResultsNYU/normals/';
	%load the point cloud.
	tmp = load([c.alignDepthDir '/img_' num2str(im_i,'%04d') '_pcV0.mat']);
	pc(:,:,1) = tmp.x3;
	pc(:,:,2) = tmp.y3;
	pc(:,:,3) = tmp.z3;

	%Load the normals
	selN = param.selN;
	outFileName = [c.normalsDir 'img_' num2str(im_i,'%04d') '_normalsV' param.localNormalExt '.mat'];
	dt = load(outFileName);
	N = dt.N{selN};

	%Find the gravity vector
	y0 = [0 1 0]';
	yFun = @(N,x) getYDirV3(N, getYDirV3(N,x,45,5),5,5);
	yDir = yFun(N,[0 1 0]');

	%Rotate te normals and the point cloud.
	R = getRMatrix(y0,yDir);
	NRot = rotatePC(N,R');
	pcRot = rotatePC(pc,R');
end

function yDir = getYDirV3(N, y0, thresh, iter)
	%Input: Normal at each pixel.
	nn = permute(N,[3 1 2]);     
	nn = reshape(nn,[3 numel(nn)/3]);
	nn = nn(:,~isnan(nn(1,:)));  
	
	%Set it up as a optimization problem.

	yDir = y0;
	%Let us do hard assignments
	for i = 1:iter,
		sim0 = yDir'*nn;
		indF = abs(sim0) > cosd(thresh);
		indW = abs(sim0) < sind(thresh);

		NF = nn(:,find(indF));
		NW = nn(:,find(indW));
		C = 1;
		A = C*NW*NW' - NF*NF';
		b = zeros(3,1);
		c = size(NF,2);

		[V D] = eig(A);
		[gr ind] = min(diag(D));
		newYDir = V(:,ind);
		yDir = newYDir.*sign(yDir'*newYDir);
	end
end

function tmp = rotatePC(pc,R)
	pc = permute(pc,[3 1 2]);
	tmp = reshape(pc,[3 numel(pc)/3]);
	tmp = R*tmp;
	tmp = reshape(tmp, size(pc));
	tmp = permute(tmp,[2 3 1]);
	pc = tmp;
end

function R = getRMatrix(yi, yf)
	yi = yi./norm(yi);
	yf = yf./norm(yf);

	%Find angle of rotation
	phi = acosd(abs(yi'*yf));
	if(abs(phi) > 0.1),
		ax = cross(yi,yf);
		ax = ax./norm(ax);
		phi = phi*(pi/180);
		S_hat = [ 0 -ax(3) ax(2); ax(3) 0 -ax(1);-ax(2) ax(1) 0];
		R = eye(3) + sin(phi)*S_hat + (1-cos(phi))*(S_hat^2);
	else
		R = eye(3,3);
	end
end
