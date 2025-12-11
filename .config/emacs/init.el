;;; -*- lexical-binding: t; -*-

(defun fs-tangle-literate-emacs-config ()
  "Tangle the current org file on save."
  (when (string-equal (buffer-file-name)
                      (expand-file-name "~/.config/emacs/config.org"))
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'after-save-hook #'fs-tangle-literate-emacs-config)

(use-package org
  :ensure nil  ; Org is built-in, so we don't need to download it
  :config
(setq org-ellipsis " ▾"))

(add-hook 'org-mode-hook #'org-indent-mode) ; Indent text below headlines
(add-hook 'org-mode-hook #'visual-line-mode) ; Wraps lines that are longer then the window

(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package savehist
  :ensure nil ; Built-in
  :init (savehist-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (orderless-matching-styles
   '(orderless-literal
     orderless-regexp
     orderless-flex)))
