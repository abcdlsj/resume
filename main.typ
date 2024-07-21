#let dividerline() = {
  v(-3pt)
  line(length: 100%, stroke: gray)
  v(-10pt)
}

#let fa(name) = {
  text(
    font: "Font Awesome 6 Free Solid",
    box[ #name ],
  )
}

#let link-icon = symbol("\u{f0c1}")

#let github = symbol("\u{f09b}")
#let blog = symbol("\u{f09e}")
#let email = symbol("\u{f0e0}")

#let iconlink(
  uri,
  text: [],
  icon: link-icon,
) = {
  if text == [] {
    text = uri
  }
  link(uri)[#fa[#icon] #text]
}

#let githublink(userRepo) = {
  link("https://github.com/" + userRepo)[#fa[#github] #userRepo]
}

#let emaillink(emailaddr) = {
  link("mailto:" + emailaddr)[#fa[#email] #emailaddr]
}

#let cventry(
  tl: "",
  tr: "",
  bl: [],
  br: [],
  content,
) = {
  block(
    inset: (left: 0pt),
    if tl != "" or tr != "" {
      tl + h(1fr) + tr + linebreak()
    } + if bl != [] or br != [] {
      bl + h(1fr) + br + linebreak()
    } + content,
  )
}

#let cv(body) = {
  set par(justify: true)

  show heading.where(level: 1): set text(
    size: 16pt,
    weight: "light",
  )

  let the-font = (
    "Palatino",
    "Noto Serif SC",
  )

  show heading.where(level: 2): it => text(
    size: 14pt,
    font: the-font,
    weight: "bold",
    block(dividerline() + it),
  )

  show heading.where(level: 3): it => text(
    size: 12pt,
    font: the-font,
    weight: "medium",
    block(it),
  )

  set list(indent: 2pt)
  set text(
    size: 10pt,
    font: the-font,
  )

  show link: it => underline(offset: 2pt, it)
  set page(
    margin: (x: 0.5cm, y: 0.9cm),
    numbering: "1 / 1",
  )
  set par(justify: true)

  body
}

#let Chinese = 0
#let EnglishFull = 1
#let Simplified = 2
#let runReader(mode) = {
  let translate(zh: [], en: []) = {
    if mode == Chinese {
      zh
    } else {
      en
    }
  }
  let noSimple(simple: [], content) = {
    if mode == Simplified {
      simple
    } else {
      content
    }
  }
  let months = (
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  )
  let translate-date(month, year) = translate(
    zh: [#year 年 #month 月],
    en: [#months.at(month - 1), #year],
  )
  let current = translate(
    zh: [至今],
    en: [Present],
  )

  let edu = {
    translate(en: [== Education], zh: [== 教育经历])
    let psu-date = [#translate-date(9, 2017) -- #translate-date(7, 2021)]
    translate(
      en: cventry(
        tl: [Bachelor's Degree in Electronic Information Science and Technology, *HeFei University of Technology*],
        tr: psu-date,
      )[],
      zh: cventry(
        tl: [合肥工业大学,电子信息科学与技术专业，本科],
        tr: psu-date,
      )[],
    )
  }

  let shopeework = {
    translate(
      en: [=== *Shopee Inc.*, ShenZheng, China],
      zh: [=== 深圳虾皮信息科技发展有限公司],
    )

    let openresty = link("https://openresty.org", "OpenResty")

    translate(
      en: cventry()[],
      zh: cventry(
        bl: [*Shopee 卖家平台*, Backend],
        br: [#translate-date(7, 2021) -- #translate-date(2, 2023)],
      )[
        - 卖家平台负责公有能力、账号、登陆等方向，包括 API 网关、卖家主站、统一登录、主子账号系统、功能开关项目等。
        - 主要负责卖家主站和功能开关项目的开发，设计实现多个统一框架模块，如汇率、弹窗、审核系统、导出中心、打标等。
        - 设计实现主站公告、侧边栏、店铺设置等首页模块，维护问卷系统、管理平台等服务。
        - 参与开发卖家部门 #openresty 网关，设计维护插件系统。
      ],
    )

    translate(
      en: cventry()[],
      zh: cventry(
        bl: [*Shopee 开放平台*, Backend],
        br: [#translate-date(2, 2023) -- #current],
      )[
        - 开放平台提供 OpenAPI 鉴权授权、消息推送、站点等功能，为 Shopee 千万店铺提供全面的商家管理能力。
        - 主要负责网关、控制台、推送系统等服务的开发，丰富控制台功能、提高鉴权授权性能、提升系统可观测性，提高用户体验。
        - 参与地区拆分方案（异地多活），以及容灾方案（同城多活），提高系统稳定性。
        - 参与横向项目开发，如重构、降本增效、服务治理、地区拆分、容灾等。
      ],
    )
  }

  let gateway = {
    cventry(
      tl: [*API Gateway*],
      tr: link("https://open.shopee.com/"),
    )[]

    translate(
      en: [
      ],
      zh: [
        - 基于 OpenResty 实现，使用 Lua 语言开发，包括请求转发（HTTP/RPC/RPC-Over-HTTP）、流量控制、灰度规则、认证鉴权等功能
        - 基于插件系统开发并维护多个插件，其中 OpenAPI 上报插件实现调用统计功能(60k+QPS)，数据经由 Kafka 传输到 ES 和 Hive/Clickhouse，为其他系统提供数据支持。并实现了类 JsonPath 规则解析器，用于解析并处理返回数据。
      ],
    )
  }

  let openservice = {
    cventry(
      tl: [*Open Service*],
      tr: link("https://open.shopee.com/"),
    )[]

    translate(
      en: [
      ],
      zh: [
        - 基于地区拆分方案，优化推送系统延迟，有效降低异地推送耗时（600ms->30ms）、降低推送系统延迟。
        - 基于上报数据统计，添加多个控制台面板，如调用统计、商业分析、日志搜索等。
      ],
    )
  }


  let sellermisc = {
    cventry(
      tl: [*Seller Service*],
      tr: link("https://open.shopee.com/"),
    )[]

    translate(
      en: [],
      zh: [
        - 主站服务包含统一弹窗、侧边栏等模块，内部广泛采用了异步加载、缓存和消息队列等技术，显著提升了网站响应速度和卖家体验。
        - 功能开关项目用于灵活配置功能黑白名单，具有打标、版本管理和回滚等功能，广泛被部门内部使用。
      ],
    )
  }

  let partnervoucher = {
    cventry(
      tl: [*Partner Voucher*],
      tr: link("https://partnervoucher.shopee.co.id/"),
    )[]

    translate(
      en: [
      ],
      zh: [
        - 在线充值券码管理服务，提供组织管理、余额、订单和审批流等功能，提升用户体验和运营效率。
        - 独立完成后端设计与开发，并与多个团队联调，负责推进项目开发部分并管理进度。
      ],
    )
  }

  let gnar = {
    cventry(
      tl: [*Gnar*],
      tr: githublink("abcdlsj/gnar"),
    )[]

    translate(
      en: [
        - Intranet port forwarding tool, similar to Frp/Ngork
        - Forwarding protocol support TCP/UDP,using Yamux support multiplexing
      ],
      zh: [
        - 内网端口转发工具，类似于 Frp/Ngork
        - 转发协议支持 TCP/UDP，使用 Yamux 支持多路复用
      ],
    )
  }

  let cLsm = {
    cventry(
      tl: [*cLSM*],
      tr: githublink("abcdlsj/clsm"),
    )[]

    translate(
      en: [],
      zh: [
        - 基于 SkipList 的 LSM-Tree 数据结构实现
      ],
    )
  }

  let skills = {

    let progLang = {
      let very = "Go"
      let somehow = ("Python", "Lua", "Cpp")
      translate(
        en: [
        ],
        zh: [
          - 编程语言：熟悉 Go，了解 Python、Lua、C++、Rust。
        ],
      )
    }
    let systemNetwork = {
      translate(
        en: [- ],
        zh: [- 操作系统 \& 网络：熟悉操作系统，包括进程、内存、Linux、多路复用、容器化技术。熟悉常见网络协议。],
      )
    }
    let devTools = {
      translate(
        en: [
        ],
        zh: [- 开发工具：善于使用日常工具和脚本，有使用 Jira、Gitlab、Confluence 等团队协作工具的经验。],
      )
    }
    progLang
    systemNetwork
    devTools
  }

  let misc = {
    translate(
      en: [],
      zh: [
        - 喜欢折腾和探索,热爱分享和记录
      ],
    )
  }

  translate(en: [= #smallcaps[Songjian Li]], zh: [= 李松健])

  [#emaillink("career@songjian.li") $dot.c$ #iconlink(
      "https://abcdlsj.github.io",
      icon: blog,
    ) $dot.c$ #iconlink(
      "https://github.com/abcdlsj",
      icon: github,
    )]
  edu

  translate(en: [== Work Experience], zh: [== 工作经历])
  shopeework

  translate(en: [== Related Projects], zh: [== 项目经历])
  gateway
  openservice
  sellermisc
  partnervoucher

  translate(en: [== Personal Projects], zh: [== 个人项目])
  gnar
  cLsm

  translate(en: [== Skills], zh: [== 技能])
  skills

  translate(en: [== Misc], zh: [== 其它])
  misc
}
