(require 'prelude-programming)

(prelude-require-packages '(fsharp-mode eglot-fsharp))
(require 'fsharp-mode)

(add-to-list 'auto-mode-alist '("\\.fs\\'" . fsharp-mode))

(require 'eglot-fsharp)

(provide 'prelude-fsharp)
