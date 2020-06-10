function norm = entropy_norm(phi, beta)

DxForward = phi([2:end 1],:,:)-phi;
DyForward = phi(:,[2:end 1],:)-phi;
DxBackword = phi - phi([end 1:end-1],:,:);
DyBackward = phi - phi(:,[end 1:end-1],:);

if beta > 0
    norm = (sum(sum((min(DxBackword,eps)).^2 + (max(DxForward,eps)).^2 + (min(DyBackward,eps)).^2 + (max(DyForward,eps)).^2))).^0.5;
elseif beta < 0
    norm = (sum(sum((min(DxForward,eps)).^2 + (max(DxBackword,eps)).^2 + (min(DyForward,eps)).^2 + (max(DyBackward,eps)).^2))).^0.5;
end

end