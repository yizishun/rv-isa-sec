# RISC-V 规范开发生命周期

## 组织架构

RISC-V International 下面有多个委员会和 SIG (Special Interest Group)：

- **TSC (Technical Steering Committee)**: 最终技术决策，审批 ratification
- **Unprivileged ISA Committee**: 管理非特权架构手册 (= riscv/riscv-isa-manual)
- **Privileged ISA Committee**: 管理特权架构手册 (= riscv/riscv-isa-manual Volume II)
- **各 Task Group (TG)**: 负责具体扩展规范，各有独立 repo

## Spec 的六大阶段

### 1. Concept (概念)
- 社区或成员提出新扩展/规范的想法
- 在对应 Committee/HC 下形成 Task Group
- TG charter 被批准 → 正式启动

### 2. Draft (草稿)
- **主要 PR 活动阶段**
- TG 在 GitHub repo 上协作，通过 PR 迭代 spec 内容
- PR 可以包含重大功能变更、新新增指令、语义修改
- 这个阶段 PR 数量最多、变更幅度最大
- 在 spec header 或 preface 中标记为 "Draft"

### 3. Stable (稳定)
- TG 认为 spec 功能完整
- **不再接受功能新增的 PR**，只能合入澄清、修复、typo 类 PR
- 开始 Architecture Review（由其他社区成员审阅）
- 文档中有明确的 "Stable" 标记

### 4. Public Review (公开审阅)
- 至少持续 30 天
- 在 riscv.org 和邮件列表公开征求反馈
- 任何人（包括非成员）都可以提意见
- 此阶段的 PR 通常只处理 review 中发现的问题

### 5. Frozen (冻结)
- 公开审阅结束后，spec 进入冻结状态
- **只能合入 typo fix 级别的 PR**
- 提交给 TSC 进行 ratification vote
- 文档标记为 "Frozen"

### 6. Ratified (正式批准)
- TSC 投票通过 → spec 成为正式 RISC-V 标准
- 发布在 https://riscv.org/specifications/
- GitHub repo 打 release tag（如 riscv-isa-manual/releases）
- **此后仍可能有 errata PR**，走单独流程

## PR → 正式手册的时序

关键问题：一个被 merge 的 PR 什么时候变成"正式手册"？

### ISA Manual (riscv/riscv-isa-manual)
- **Draft 期间**: merge 的 PR 立即出现在 master 分支的源码中
  - 自动 CI 会构建 draft PDF，发布到 GitHub Releases
  - 这些 PDF 标记为 "Draft"，非正式标准
- **Ratification**: TSC 批准后，某个特定 commit 被标记为 ratified version
  - 对应的 PDF 发布到 riscv.org 作为官方版本
  - 并非每个 merge 的 PR 都独立公布，而是批量 ratify

### 独立扩展 repo (如 riscv-aia, riscv-sbi-doc 等)
- 扩展 spec 独立于 ISA Manual 维护
- 有各自的 GitHub Releases 发布 ratified 版本
- Ratified 后其内容也可能被整合进主 ISA manual 的某章

## 对 Linux 的影响链路

```
Spec PR merged on GitHub
    ↓ (数周到数月)
Spec ratification (TSC 批准)
    ↓ (快速或数月)
内核社区意识到新的 requirement
    ↓
Linux kernel patch 提交
    ↓ (数周)
合并入主线
```

关键延迟在中间两个环节——ratification 到社区意识之间的认知延迟，以及补丁提交到合入的社区流程延迟。这段延迟期是漏洞可能产生的窗口。

## 关键观察

1. **绝大多数"语义"PR 在 Draft 阶段合入**——这时它们还只是"草稿"，但硬件实现可能已经开始
2. **Ratified 后的 errata 修复 PR**——通常因为发现了安全/功能问题，这些 PR 本身暗示了之前版本有 bug
3. **PR 的 review comment 和 discussion**——可能揭示了设计者知道但不明显写入 spec 的微妙语义
4. **Negative review / rejecting PR**——同样有价值，说明某个语义选择被主动排除
