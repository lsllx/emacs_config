;;
;; Copyright (c) 2012 Lu Li
;;
;; Author: Lu Li <lilu.life@gmail.com>
;; URL: https://github.com/Lilu/my-emacs

;; This file is not part of GNU Emacs.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . ruby-mode))
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
;;(require 'rbenv)
;;(global-rbenv-mode)
;;(setq ruby-insert-encoding-magic-comment nil)

(defun ruby-mode-defaults ()
  "My ruby mode hooks"
  (require 'ruby-block)
  (ruby-block-mode t)
  (setq ruby-block-highlight-toggle t)
  (ruby-end-mode +1)
  (setq comint-process-echoes t)
  (local-set-key (kbd "C-h r") 'yari))
(add-hook 'ruby-mode-hook 'ruby-mode-defaults)

(defun browse-development ()
  "Browse rails development url"
  (interactive)
  (browse-url "http://127.0.0.1:3000"))

(defun spawn-guard ()
  "Invoke shell to spawn guard"
  (interactive)
  (pop-to-buffer (get-buffer-create (generate-new-buffer-name "*guard*")))
  (shell (current-buffer))
  (process-send-string nil "bundle exec guard\n"))

(defun powder-restart ()
  "Invoke shell to powder restart"
  (interactive)
  (pop-to-buffer (get-buffer-create (generate-new-buffer-name "*powder*")))
  (shell (current-buffer))
  (process-send-string nil "powder restart\n powder applog\n"))

(provide 'my-ruby)
