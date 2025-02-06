(require 'prelude-programming)

<<<<<<< HEAD
;; Similar to vim-illuminate
(prelude-require-packages '(idle-highlight-mode))
=======
(prelude-require-packages
 '(;; Similar to vim-illuminate
   idle-highlight-mode
   ;; Generate links to the repository from a buffer.
   git-link
   quelpa
   ;; Required by copilot.
   editorconfig))

(quelpa
 '(copilot :fetcher github
           :repo "zerolfx/copilot.el"
           :branch "main"
           :files ("dist" "*.el")))

>>>>>>> 56adc9a... Add package to generate links to the repository from buffers

(defun personal-prog-mode-defaults ()
  ;; Disable auto-saving features
  (setq auto-save-default nil)
  (require 'super-save)
  (super-save-mode -1)
  ;; This makes the text completion case sensitive.
  ;; https://emacs.stackexchange.com/a/10838/31688
  (setq company-dabbrev-downcase nil)
  (idle-highlight-mode +1)
  ;; Treat "_" as part of words.
  ;; https://evil.readthedocs.io/en/latest/faq.html#underscore-is-not-a-word-character
  (modify-syntax-entry ?_ "w"))

(add-hook 'prelude-prog-mode-hook 'personal-prog-mode-defaults)
