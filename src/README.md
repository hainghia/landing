[//]: # (![logo]&#40;logo.svg?raw=true "logo.svg"&#41;)
___

## Git Repositories

- [GitHub](https://github.com/rust-pro/wasm-todo)
- [GitLab](https://gitlab.com/rust-inc/wasm-todo)
- [Bitbucket](https://bitbucket.org/hainghia/wasm-todo)

### Remote repository

```shell
git remote -v

git remote add origin git@github.com:rust-pro/wasm-todo.git
git remote add gitlab git@gitlab.com:rust-inc/wasm-todo.git
git remote add bitbucket git@bitbucket.org:hainghia/wasm-todo.git


git add .; git commit -asm "Initial commit";git push origin main; git push gitlab main; git push bitbucket main
```

## [Trunk Commands](https://trunkrs.dev/commands)

[trunkrs](https://trunkrs.dev/#install)

```shell
cargo install --locked trunk
```

`trunk build` runs a cargo build targeting the wasm32 instruction set, runs `wasm-bindgen` on the built WASM, and spawns
asset build pipelines for any assets defined in the target `index.html`

```shell
trunk build --release
```

`trunk watch` does the same thing as `trunk build`, but also watches the filesystem for changes, triggering new builds
as changes are detected.

```shell
trunk watch
```

`trunk serve` does the same thing as `trunk watch`, but also spawns a web server.

```shell
trunk serve
```

Cleans up any build artifacts generated from earlier builds.

```shell
trunk clean
```