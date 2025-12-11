(defun fs-tangle-literate-emacs-config ()
  "Tangle the current org file on save."
  (when (string-equal (buffer-file-name)
                      (expand-file-name "~/.config/emacs/config.org"))
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'after-save-hook #'fs-tangle-literate-emacs-config)
