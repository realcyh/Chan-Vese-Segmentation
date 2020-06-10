function kappa = curvature(phi)

phi_x = ( phi([2:end 1],:,:)-phi([end 1:end-1],:,:) )./2;
phi_y = ( phi(:,[2:end 1],:)-phi(:,[end 1:end-1],:) )./2;
phi_xy = ( phi_x(:,[2:end 1],:)-phi_x(:,[end 1:end-1],:) )./2;
phi_xx = ( phi([2:end 1],:,:)- 2.*phi + phi([end 1:end-1],:,:) )./ 1;
phi_yy = ( phi(:,[2:end 1],:)- 2.*phi + phi(:,[end 1:end-1],:) )./ 1;

kappa = -(phi_xx.*(phi_y.^2) - 2.*phi_x.*phi_y.*phi_xy + phi_yy.*(phi_x.^2))./(max(eps, ((phi_x.^2)+(phi_y.^2))));

end