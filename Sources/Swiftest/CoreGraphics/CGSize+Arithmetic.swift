//
//  CGSizeExtensions.swift
//  Pods
//
//  Created by Brian Strobach on 8/10/16.
//  Copyright © 2018 Appsaurus
//

#if canImport(CoreGraphics)
import CoreGraphics

public func -(l: CGSize, r: CGSize) -> CGSize { return CGSize(width: l.width - r.width, height: l.height - r.height) }
public func +(l: CGSize, r: CGSize) -> CGSize { return CGSize(width: l.width + r.width, height: l.height + r.height) }
public func *(l: CGSize, r: CGSize) -> CGSize { return CGSize(width: l.width * r.width, height: l.height * r.height) }
public func /(l: CGSize, r: CGSize) -> CGSize { return CGSize(width: l.width / r.width, height: l.height / r.height) }

public func -(l: CGSize, r: CGFloat) -> CGSize { return CGSize(width: l.width - r, height: l.height - r) }
public func +(l: CGSize, r: CGFloat) -> CGSize { return CGSize(width: l.width + r, height: l.height + r) }
public func *(l: CGSize, r: CGFloat) -> CGSize { return CGSize(width: l.width * r, height: l.height * r) }
public func /(l: CGSize, r: CGFloat) -> CGSize { return CGSize(width: l.width / r, height: l.height / r) }

public func -=( l: inout CGSize, r: CGSize) { l = l - r }
public func +=( l: inout CGSize, r: CGSize) { l = l + r }
public func *=( l: inout CGSize, r: CGSize) { l = l * r }
public func /=( l: inout CGSize, r: CGSize) { l = l / r }

public func -=( l: inout CGSize, r: CGFloat) { l = l - r }
public func +=( l: inout CGSize, r: CGFloat) { l = l + r }
public func *=( l: inout CGSize, r: CGFloat) { l = l * r }
public func /=( l: inout CGSize, r: CGFloat) { l = l / r }

#endif
