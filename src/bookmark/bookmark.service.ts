import { Injectable } from '@nestjs/common';
import { PrismaService } from './../prisma/prisma.service';
import { EditBookmarkDto } from './dto/edit-bookmark.dto';
import { CreateBookmarkDto } from './dto/create-bookmark.dto';

@Injectable()
export class BookmarkService {
  constructor(private prisma: PrismaService) {}
  getBookmarks() {
    return this.prisma.bookmark.findMany();
  }

  async getSingleBookmark(bookmarkId: number) {
    const bookmark = await this.prisma.bookmark.findFirst({
      where: {
        id: bookmarkId,
      },
    });

    if (!bookmark) {
      throw new Error('Bookmark not found');
    }

    return bookmark;
  }

  async createBookmark(dto: CreateBookmarkDto) {
    const bookmark = await this.prisma.bookmark.create({
      data: {
        ...dto,
      },
    });
    return bookmark;
  }

  async editBookmark(bookmarkId: number, dto: EditBookmarkDto) {
    // get the bookmark id
    const bookmark = await this.prisma.bookmark.findUnique({
      where: {
        id: bookmarkId,
      },
    });

    if (!bookmark) {
      throw new Error('Bookmark not found');
    }
    // modify bookmark
    return this.prisma.bookmark.update({
      where: {
        id: bookmarkId,
      },
      data: {
        ...dto,
      },
    });
  }

  async deleteBookmark(bookmarkId: number) {
    const bookmark = await this.prisma.bookmark.findUnique({
      where: {
        id: bookmarkId,
      },
    });

    if (!bookmark) {
      throw new Error('Bookmark not found');
    }

    await this.prisma.bookmark.delete({
      where: {
        id: bookmarkId,
      },
    });
  }
}
