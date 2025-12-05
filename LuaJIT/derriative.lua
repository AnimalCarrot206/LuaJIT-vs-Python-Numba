return function (f, x0, eps)
    eps = eps or 1e-12
    return (f(x0 + eps) - f(x0)) / eps
end